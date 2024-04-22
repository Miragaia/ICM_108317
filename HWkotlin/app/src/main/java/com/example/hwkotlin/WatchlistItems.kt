package com.example.hwkotlin

import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.runtime.Composable
import androidx.compose.foundation.lazy.items


@Composable
fun WatchlistItems(watchlist: List<String>, viewModel: WatchlistViewModel) {
    LazyColumn {
        items(watchlist) { item ->
            WatchlistItem(
                name = item,
                onWatched = { viewModel.markAsWatched(item) }
            )
        }
    }
}


