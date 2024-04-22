package com.example.hwkotlin

import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalFocusManager
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.unit.dp
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.getValue
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier

@Composable
fun WatchlistInput(viewModel: WatchlistViewModel) {
    val context = LocalContext.current
    val focusManager = LocalFocusManager.current

    var textState by remember { mutableStateOf(TextFieldValue()) }

    Surface(
        shape = MaterialTheme.shapes.medium,
        //elevation = 8.dp,
        modifier = Modifier.fillMaxWidth()
    ) {
        TextField(
            value = textState,
            onValueChange = { textState = it },
            label = { Text("Add new entry") },
            keyboardOptions = KeyboardOptions(imeAction = ImeAction.Done),
            keyboardActions = KeyboardActions(onDone = {
                if (textState.text.isNotEmpty()) {
                    viewModel.addEntry(textState.text)
                    textState = TextFieldValue()
                    focusManager.clearFocus()
                }
            }),
            modifier = Modifier.padding(8.dp)
        )
    }
}
