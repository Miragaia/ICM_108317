package com.example.hwkotlin

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.MutableState
import androidx.compose.runtime.snapshots.SnapshotStateList
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp


@Composable
fun WatchlistContent(watchlist: List<String>, viewedList: List<String>, viewModel: WatchlistViewModel) {
    Column(
        modifier = Modifier
            .padding(16.dp)
            .fillMaxSize(),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        WatchlistInput(viewModel = viewModel)

        Text(text = "Watchlist")
        WatchlistItems(watchlist = watchlist, viewModel = viewModel)

        Text(text = "Viewed List")
        ViewedListItems(viewedList = viewedList, viewModel = viewModel)


    }
}


