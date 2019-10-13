#!/usr/bin/perl

use Version::Compare;
use JSON::Parse qw(json_file_to_perl);
use JSON::XS;
use Data::Dump qw(dump);
use Term::Table;
use Term::ReadKey;


my $TERM_SETTINGS = {};
($TERM_SETTINGS->{WIDTH}, $TERM_SETTINGS->{HEIGHT}, $TERM_SETTINGS->{WIDTH_PIXELS}, $TERM_SETTINGS->{HEIGHT_PIXELS}) = GetTerminalSize();

if($ARGV[0] && -f $ARGV[0]) {
    my $output_file = "/tmp/results.json";
    my $vulnerabilities = json_file_to_perl($ARGV[0]) or die("Couldn't read file: " . $ARGV[0]);
    my $PHP_VERSION;
    if($ARGV[1] && $ARGV[1] =~ /[\d\.]+/) {
         $PHP_VERSION=$ARGV[1];
    } else {
         print "Using PHP binary from your installation ...\n";
         $PHP_VERSION=`php --version | grep -oP "PHP [\\d+\\.]+" | sed "s#^PHP ##g"`;
         chomp $PHP_VERSION;
    }
    if($ARGV[2]) {
        $output_file=$ARGV[2];
    }
    
    if($PHP_VERSION) {
        my @matches = ();
        my $INT_PHP_VERSION = $PHP_VERSION;
        my @sub_versions = split(".", $PHP_VERSION);
        $INT_PHP_VERSION =~ s/[^0-9]+//g;
        foreach my $item (@{ $vulnerabilities->{checks} }) {
            if(defined($item->{fixVersions})) {
                foreach my $version_group (sort keys %{ $item->{fixVersions} }) {
                    foreach my $version (@{ $item->{fixVersions}->{$version_group} }) {
                        if($version && &Version::Compare::version_compare($version, $PHP_VERSION)==1) { 
                            push(@matches, { title => $item->{cveid} . " - (" . $item->{threat} . ")", description => $item->{summary}, cve => $item->{cveid}, versions => join(", ", @{ $item->{fixVersions}->{$version_group} }), references => get_references($item->{cveid}), });
                        }
                    }
                }
            }
        }
        if(0+@matches) {
            my $json_results = JSON::XS->new->pretty->encode(\@matches);
            open(FILE, ">", $output_file) or die("Couldn't write: $output_file\n");
            print FILE $json_results . "\n";
            close FILE;
            my @rows = ();            

            foreach my $match (@matches) {
                my @values = ();
                map { push(@values, $match->{$_}); } sort keys %{ $match };
                push(@rows, \@values);
            }
            my $table = Term::Table->new(
                max_width      => $TERM_SETTINGS->{WIDTH},
                pad            => 10,
                allow_overflow => 1,
                collapse       => 0,
                header => ["CVE", "Description", "Versions", "References"],
                rows => \@rows,
            );
            foreach my $line ($table->render) {
                print $line . "\n";
            }
            print "\n[JSON RESULTS] $output_file\n\n\n";
        } else {
            print "[SECURE] No vulnerabilities affecting PHP version [$PHP_VERSION] curently .\n";
        }
    } else {
        die("Missing PHP version string .\n");
    }
} else {
    die("Error in arguments .\n");
}


sub get_references {
    my ( $cve ) = shift;

    return join("\n", (
        "https://nvd.nist.gov/vuln/detail/" . uc($cve),
        "https://cve.mitre.org/cgi-bin/cvename.cgi?name=" . uc($cve),
        "https://www.cvedetails.com/cve/" . uc($cve),
        "https://cve.circl.lu/cve/" . uc($cve),
        "https://pivotal.io/security/" . lc($cve),
    ));
}
