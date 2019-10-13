#!/bin/bash

DIRECTORY="."

# APK
if [ ! -z "$1" ]
then
    DIRECTORY="$1"
fi

rg -oNIzP   '(^127\.)|(^10\.)|(^172\.1[6-9]\.)|(^172\.2[0-9]\.)|(^172\.3[0-1]\.)|(^192\.168\.)' /opt/AndroidAPK/-MARA/data/$file_/source/jadx >> private_ip.txt
rg -oNIzP   '(^127\.)|(^10\.)|(^172\.1[6-9]\.)|(^172\.2[0-9]\.)|(^172\.3[0-1]\.)|(^192\.168\.)' /opt/AndroidAPK/-MARA/data/$file_/source/java >> private_ip.txt
rg -oNIzP   'android.location|getLastKnownLocation|requestLocationUpdates|getLatitude|getLongitude' ${DIRECTORY} | sort -u >> location_services.txt
rg -oNIzP   'android.util.Base64|.decode' ${DIRECTORY} | sort -u >> crypto_implementation.txt
rg -oNIzP   'android.util.Base64|.encodeToString|.encode' ${DIRECTORY} | sort -u >> crypto_implementation.txt
rg -oNIzP   'android.webkit' ${DIRECTORY} | sort -u >> webview_implementation.txt
rg -oNIzP   'app.NotificationManager' ${DIRECTORY} | sort -u >> notification.txt
rg -oNIzP   'com.noshufou.android.su|com.thirdparty.superuser|eu.chainfire.supersu|com.koushikdutta.superuser|eu.chainfire.' ${DIRECTORY} | sort -u >> root_activity.txt
rg -oNIzP   'content.ContentResolver' ${DIRECTORY} | sort -u >> database.txt
rg -oNIzP   'content://' ${DIRECTORY} | sort -u >> content_providers.txt
rg -oNIzP   'dalvik.system.DexClassLoader|java.security.ClassLoader|java.net.URLClassLoader|java.security.SecureClassLoader' ${DIRECTORY} | sort -u >> dynamic_loading.txt
rg -oNIzP   'dalvik.system.PathClassLoader|dalvik.system.DexFile|dalvik.system.DexPathList|dalvik.system.DexClassLoader|loadDex|loadClass|DexClassLoader|loadDexFile' ${DIRECTORY} | sort -u >> dynamic_loading.txt
rg -oNIzP   'DatagramSocket|net.DatagramSocket' ${DIRECTORY} | sort -u >> network_communication.txt
rg -oNIzP   'dexguard.util|sDebugDetector.isDebuggable' ${DIRECTORY} | sort -u >> anti-tamper_protection.txt
rg -oNIzP   'getAllCellInfo' ${DIRECTORY} | sort -u >> location_services.txt
rg -oNIzP   'getCellLocation' ${DIRECTORY} | sort -u >> location_services.txt
rg -oNIzP   'getRuntime().exec|getRuntime' ${DIRECTORY} | sort -u >> system_commands.txt
rg -oNIzP   'getSimSerialNumber|getSimOperator|getSimOperatorName' ${DIRECTORY} | sort -u >> device_details.txt
rg -oNIzP   'getSubscriberId|getDeviceId|getDeviceSoftwareVersion' ${DIRECTORY} | sort -u >> device_details.txt
rg -oNIzP   'getSystemService' ${DIRECTORY} | sort -u >> system_service.txt
rg -oNIzP   'http.client.HttpClient|net.http.AndroidHttpClient|http.impl.client.AbstractHttpClient' ${DIRECTORY} | sort -u >> network_communication.txt
rg -oNIzP   'HttpURL|org.apache.http|HttpRequest' ${DIRECTORY} | sort -u >> network_communication.txt
rg -oNIzP   'import dexguard.util|CertificateChecker.checkCertificate' ${DIRECTORY} | sort -u >> anti-tamper_protection.txt
rg -oNIzP   'import dexguard.util|DebugDetector.isDebuggerConnected' ${DIRECTORY} | sort -u >> anti-tamper_protection.txt
rg -oNIzP   'import dexguard.util|EDebugDetector.isSignedWithDebugKey' ${DIRECTORY} | sort -u >> anti-tamper_protection.txt
rg -oNIzP   'import dexguard.util|EmulatorDetector.isRunningInEmulator' ${DIRECTORY} | sort -u >> anti-tamper_protection.txt
rg -oNIzP   'import dexguard.util|RootDetector.isDeviceRooted' ${DIRECTORY} | sort -u >> anti-tamper_protection.txt
rg -oNIzP   'import dexguard.util|TamperDetector.checkApk' ${DIRECTORY} | sort -u >> anti-tamper_protection.txt
rg -oNIzP   'IRemoteService|IRemoteService.Stub|IBinder' ${DIRECTORY} | sort -u >> inter_process_comm.txt
rg -oNIzP   'java.lang.reflect.Method|java.lang.reflect.Field|Class.forName' ${DIRECTORY} | sort -u >> java_reflection.txt
rg -oNIzP   'java.lang.System|java.lang.Runtime' ${DIRECTORY} | sort -u >> java_code.txt
rg -oNIzP   'java.security.MessageDigest|.MessageDigestSpi|MessageDigest' ${DIRECTORY} | sort -u >> crypto_implementation.txt
rg -oNIzP   'java.util.Random' ${DIRECTORY} | sort -u >> crypto_implementation.txt
rg -oNIzP   'javax.crypto|kalium.crypto|bouncycastle.crypto' ${DIRECTORY} | sort -u >> crypto_implementation.txt
rg -oNIzP   'javax.net.ssl.HttpsURL|HttpsURL' ${DIRECTORY} | sort -u >> network_communication.txt
rg -oNIzP   'javax.net.ssl|TrustAllSSLSocket-Factory|AllTrustSSLSocketFactory|NonValidatingSSLSocketFactory|ALLOW_ALL_HOSTNAME_VERIFIER|.setDefaultHostnameVerifier|NullHostnameVerifier' ${DIRECTORY} | sort -u >> crypto_implementation.txt
rg -oNIzP   'loadData' ${DIRECTORY} | sort -u >> webview_implementation.txt
rg -oNIzP   'Log[.][vdiwe]|System.out.print' ${DIRECTORY} | sort -u >> app_logging.txt
rg -oNIzP   'MODE_private_ip|Context.MODE_private_ip' ${DIRECTORY} | sort -u >> filesystem_access.txt
rg -oNIzP   'MODE_WORLD_READABLE|Context.MODE_WORLD_READABLE' ${DIRECTORY} | sort -u >> filesystem_access.txt
rg -oNIzP   'MODE_WORLD_WRITABLE|Context.MODE_WORLD_WRITABLE' ${DIRECTORY} | sort -u >> filesystem_access.txt
rg -oNIzP   'net.JarURL|JarURL|jar:' ${DIRECTORY} | sort -u >> network_communication.txt
rg -oNIzP   'net.JarURL|JarURLnetwork_communication:' ${DIRECTORY} | sort -u >> network_communication.txt
rg -oNIzP   'net.URL|openStream' ${DIRECTORY} | sort -u >> network_communication.txt
rg -oNIzP   'onReceivedSslError|.proceed' ${DIRECTORY} | sort -u >> webview_implementation.txt
rg -oNIzP   'OpenFileOutput|getSharedPreferences|SharedPreferences.Editor|getCacheDir|getExternalStorageState|openOrCreateDatabase' ${DIRECTORY} | sort -u >> IO_operations.txt
rg -oNIzP   'org.thoughtcrime.ssl.pinning|PinningHelper.getPinnedHttpsURLConnection|PinningHelper.getPinnedHttpClient|PinningSSLSocketFactory' ${DIRECTORY} | sort -u >> crypto_implementation.txt
rg -oNIzP   'password =|secret =|username =|key =' ${DIRECTORY} | sort -u >> hardcoded_info.txt
rg -oNIzP   'postUrl' ${DIRECTORY} | sort -u >> network_communication.txt
rg -oNIzP   'rawQuery|SQLiteDatabase|execSQL|android.database.sqlite' ${DIRECTORY} | sort -u >> SQLite_Database.txt
rg -oNIzP   'sendBroadcast|sendOrderedBroadcast|sendStickyBroadcast' ${DIRECTORY} | sort -u >> activities_services_broadcasts.txt
rg -oNIzP   'sendMultipartTextMessage|sendTextMessage|vnd.android-dir/mms-sms|telephony.SmsManager' ${DIRECTORY} | sort -u >> sms_mms.txt
rg -oNIzP   'ServerSocket|net.ServerSocket|connect[(][)]' ${DIRECTORY} | sort -u >> network_communication.txt
rg -oNIzP   'setJavaScriptEnabled|.addJavascriptInterface' ${DIRECTORY} | sort -u >> webview_implementation.txt
rg -oNIzP   '.setWebContentsDebuggingEnabled(true)' ${DIRECTORY} | sort -u >> webview_implementation.txt
rg -oNIzP   'startActivity\(|startActivityForResult' ${DIRECTORY} | sort -u >> activities_services_broadcasts.txt
rg -oNIzP   'startService|bindService' ${DIRECTORY} | sort -u >> activities_services_broadcasts.txt
rg -oNIzP   'telephony.TelephonyManager' ${DIRECTORY} | sort -u >> telephony_access.txt
rg -oNIzP   'test-keys|/system/app/Superuser.apk|isDeviceRooted|/system/bin/failsafe/su|/system/sd/xbin/su|"/system/xbin/which"|"su"|RootTools.isAccessGiven|/system/bin/su|/system/xbin/su' ${DIRECTORY} | sort -u >> root_activity.txt
