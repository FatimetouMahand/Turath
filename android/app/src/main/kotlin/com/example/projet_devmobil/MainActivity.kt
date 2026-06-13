package com.example.projet_devmobil

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val shareChannel = "turath/share"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            shareChannel
        ).setMethodCallHandler { call, result ->
            if (call.method == "shareText") {
                val title = call.argument<String>("title") ?: "Turath"
                val text = call.argument<String>("text") ?: ""

                val sendIntent = Intent(Intent.ACTION_SEND).apply {
                    type = "text/plain"
                    putExtra(Intent.EXTRA_TITLE, title)
                    putExtra(Intent.EXTRA_TEXT, text)
                }

                startActivity(Intent.createChooser(sendIntent, title))
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }
}
