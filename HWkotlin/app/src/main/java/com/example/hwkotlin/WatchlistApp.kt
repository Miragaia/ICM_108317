package com.example.hwkotlin

import android.annotation.SuppressLint
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.compose.runtime.remember
import androidx.compose.runtime.mutableStateOf


import androidx.compose.material3.Scaffold

@Composable
fun WatchlistApp() {
    val viewModel: WatchlistViewModel = viewModel()
    val watchlist = viewModel.watchlist
    val viewedList = viewModel.viewedList

    Scaffold(
        content = {
            WatchlistContent(watchlist = watchlist, viewedList = viewedList, viewModel = viewModel)
        }
    )
}

@Preview
@Composable
fun PreviewWatchlistApp() {
    WatchlistApp()
}


