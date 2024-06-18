package com.example.bpbm_technician

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.*

class MainActivity : FlutterFragmentActivity() {
    private var isServiceRunning = false // Track service running state

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.example.bpbm_technician/service").setMethodCallHandler { call, result ->
            when (call.method) {
                "startService" -> {
                    val intent = Intent(this, ForegroundService::class.java).apply {
                        action = "com.example.bpbm_technician.START_FOREGROUND_SERVICE"
                    }
                    startForegroundService(intent)
                    isServiceRunning = true
                    result.success(null)
                }
                "stopService" -> {
                    val intent = Intent(this, ForegroundService::class.java).apply {
                        action = "com.example.bpbm_technician.STOP_FOREGROUND_SERVICE"
                    }
                    stopService(intent)
                    isServiceRunning = false
                    result.success(null)
                }
                "isServiceRunning" -> {
                    result.success(isServiceRunning)
                }
                "getUserAgent" -> {
                    val userAgent = System.getProperty("http.agent")
                    result.success(userAgent)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
