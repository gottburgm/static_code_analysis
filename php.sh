#!/bin/bash

if [ ! -z "$1 " ] && [ -e "$1" ]
then
    rg -oNIzP '(eval|popen|system|passthru|exec|shell_exec|assert|proc_open|call_user_func|call_user_func_array|preg_replace|ereg_replace|eregi_replace|mb_ereg_replace|mb_eregi_replace)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' $1 2>/dev/null $1 2>/dev/null
    rg -oNIzP '(virtual|include|require|include_once|require_once|readfile|file_get_contents|show_source|fopen|file|fpassthru|gzopen|gzfile|gzpassthru|readgzfile)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' $1 2>/dev/null
    rg -oNIzP '(mysql_query|mysql[i]?_multi_query|mysql[i]?_send_query|mysql[i]?_master_query|mysql[i]?_master_query|mysql_unbuffered_query|mysql_db_query|mysql[i]?::real_query|mysql[i]?_real_query|mysql[i]?::query|mysql[i]?_query)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' $1 2>/dev/null
    rg -oNIzP '(pg_query|pg_send_query)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' $1 2>/dev/null
    rg -oNIzP '(sqlite_array_query|sqlite_exec|sqlite_query|sqlite_single_query|sqlite_unbuffered_query)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' $1 2>/dev/null
    rg -oNIzP '(->arrayQuery|->prepare|->query|->queryExec|->singleQuery|->querySingle|->exec|->execute|->unbufferedQuery|->real_query|->multi_query|->send_query)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' $1 2>/dev/null
    rg -oNIzP '(cubrid_unbuffered_query|cubrid_query)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' $1 2>/dev/null
    rg -oNIzP '(mssql_query)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' $1 2>/dev/null
    rg -oNIzP '(move_uploaded_file)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' $1 2>/dev/null
    rg -oNIzP '(echo|print(?:f|_r)?)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' $1 2>/dev/null
    rg -oNIzP '(xpath|ldap_search)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' $1 2>/dev/null
    rg -oNIzP '(mail)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' $1 2>/dev/null
    rg -oNIzP '(unserialize)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' $1 2>/dev/null
    rg -oNIzP '(header|HttpMessage::setHeaders|HttpRequest::setHeaders)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' $1 2>/dev/null
    rg -oNIzP '(http_redirect|HttpMessage::setResponseCode)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' $1 2>/dev/null
else
    echo "Usage: $0 <Directory/file>"
fi
