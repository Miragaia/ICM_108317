package com.example.hwkotlin

import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.padding
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.compose.material3.Text
import androidx.compose.material3.Checkbox

@Composable
fun WatchlistItem(name: String, onWatched: () -> Unit) {
    Row(
        verticalAlignment = Alignment.CenterVertically,
        modifier = Modifier.padding(8.dp)
    ) {
        Text(text = name, modifier = Modifier.weight(1f))
        Checkbox(
            checked = false,
            onCheckedChange = { onWatched() }
        )
    }
}
