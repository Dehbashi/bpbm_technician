package com.example.bpbm_technician

import android.os.Bundle
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterFragmentActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "channel").setMethodCallHandler { call, result ->
            if (call.method == "getUserAgent") {
                val userAgent = System.getProperty("http.agent")
                result.success(userAgent)
            } else {
                result.notImplemented()
            }
        }
    }
}
