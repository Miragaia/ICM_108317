package com.example.hwkotlin

import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.mutableStateListOf
import androidx.lifecycle.ViewModel

class WatchlistViewModel : ViewModel() {
    val watchlist = mutableStateListOf<String>("Movie 1", "Series 1", "Movie 2")
    val viewedList = mutableStateListOf<String>()

    fun addEntry(entry: String) {
        watchlist.add(entry)
    }

    fun markAsWatched(entry: String) {
        watchlist.remove(entry)
        viewedList.add(entry)
    }

    fun deleteViewedEntry(entry: String) {
        viewedList.remove(entry)
    }
}
