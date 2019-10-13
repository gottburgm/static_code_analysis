#!/bin/bash

rg -oNIzP '(eval|popen|system|passthru|exec|shell_exec|assert|proc_open|call_user_func|call_user_func_array|preg_replace|ereg_replace|eregi_replace|mb_ereg_replace|mb_eregi_replace)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)' 
rg -oNIzP '(virtual|include|require|include_once|require_once|readfile|file_get_contents|show_source|fopen|file|fpassthru|gzopen|gzfile|gzpassthru|readgzfile)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)'
rg -oNIzP '(mysql_query|mysqli_multi_query|mysqli_send_query|mysqli_master_query|mysqli_master_query|mysql_unbuffered_query|mysql_db_query|mysqli::real_query|mysqli_real_query|mysqli::query|mysqli_query)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)'
rg -oNIzP '(pg_query|pg_send_query)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)'
rg -oNIzP '(sqlite_array_query|sqlite_exec|sqlite_query|sqlite_single_query|sqlite_unbuffered_query)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)'
rg -oNIzP '(->arrayQuery|->query|->queryExec|->singleQuery|->querySingle|->exec|->execute|->unbufferedQuery|->real_query|->multi_query|->send_query)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)'
rg -oNIzP '(cubrid_unbuffered_query|cubrid_query)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)'
rg -oNIzP '(mssql_query)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)'
rg -oNIzP '(move_uploaded_file)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)'
rg -oNIzP '(echo|print|printf)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)'
rg -oNIzP '(xpath|ldap_search)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)'
rg -oNIzP '(mail)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)'
rg -oNIzP '(unserialize)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)'
rg -oNIzP '(header|HttpMessage::setHeaders|HttpRequest::setHeaders)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)'
rg -oNIzP '(http_redirect|HttpMessage::setResponseCode)\((.*?)(\$_(COOKIES|REQUEST|POST|GET|FILES|GLOBALS|SESSION)\[.*?\]|\$(?!this|e-)[a-zA-Z0-9_]*)(.*?)\)'

