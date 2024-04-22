package com.example.hwkotlin

import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.runtime.Composable

@Composable
fun ViewedListItems(viewedList: List<String>, viewModel: WatchlistViewModel) {
    LazyColumn {
        items(viewedList) { item ->
            ViewedItem(
                name = item,
                onDelete = { viewModel.deleteViewedEntry(item) }
            )
        }
    }
}
