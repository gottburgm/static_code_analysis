### Static Code Analysis

#### Tools

  - PHP
    - *RIPS* : [RIPS Github](https://github.com/robocoder/rips-scanner)
  - JAVA
    - *JavaID* : [Regex Based Java Source Code Scanner](https://github.com/Cryin/JavaID)
    - FindSecBugs CLI: https://github.com/find-sec-bugs/find-sec-bugs/releases/download/version-1.9.0/findsecbugs-cli-1.9.0.zip

#### Links
  - *JAVA* : [Huge Article with Many Attack Vectors](https://find-sec-bugs.github.io/bugs.htm)

#### Configuration Flags

  - PHP (/etc/php.ini)
    - [allow_url_fopen](https://www.php.net/manual/en/filesystem.configuration.php#ini.allow-url-fopen)
      -	Impact:	LFI can be used as RFI
      - allow_url_fopen <1/0>: Allow/Disallow to include external resources (http://*, https://*, ftp://*, ftps://*)
   
    - [allow_url_include]()
      - allow_url_fopen <1/0>: Allow/Disallow to include external resources (http://*, https://*, ftp://*, ftps://*)
      - Impact: LFI can be used as RFI
      - Require: allow_url_fopen *ON*
      - Functions concerned:
        - include
        - include_once
        - require
        - require_once

    - [open_basedir](https://www.php.net/manual/fr/ini.core.php#ini.open-basedir)
      - open_basedir <string>: Restrict the files that PHP (and MySQL LOAD DATA trough mysqlnd driver) can work with
      - Functions concerned:
        - include
        - fopen

    - [include_path](https://www.php.net/manual/fr/ini.core.php#ini.include-path)
      - include_path <paths>: Same as UNIX PATH but for restricting PHP accesible files by specifing directories list (separated by ':')
      - Default: ".;<path_to_php_pear>"
      - Functions concerned:
        - require
        - include
        - fopen
        - file
        - readfile
        - file_get_contents


#### Vulnerable/Sensitive Functions

  - PHP
    - Sensitive
      - file_exists
      - is_dir
      - is_file
      - filesize
      - file_put_contents
      - glob
      - mkdir
      - fclose

    - LFI
      - include
      - include_once
      - file_get_contents
      - fopen

    - XXE
      - simplexml_load_file()
      - DOMDocument::load()


#### Commands

   - PHP
     - Get PHP "global" variables

     ```bash
        grep -m -r -oP '\$_(GET|POST|SERVER|SESSION|GLOBALS|REQUEST|FILES|COOKIE) <directory>
        grep -oP '\$_(GET|POST|SERVER|SESSION|GLOBALS|REQUEST|FILES|COOKIE) <file>
     ```


