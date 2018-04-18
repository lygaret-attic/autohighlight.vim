Abandoned Repository
--------------------
I no longer use this plugin (nor Vim, often), and am no longer maintaining 
this repository. If you're interested in my adding a link to a fork here in 
the readme, let me know.

---

Vim AutoHighlight
=================

This plugin will automatically highlight the word currently under the cursor 
in the current window. This allows you to more easily see where words are
being used, (eg. variable usages, etc.)


Installation
------------

If you don't have a preferred installation method, I recommend using [Vundle][].

Assuming you've got Vundle installed and configured, add the following line to 
your `.vimrc`:

```vim
Plugin 'lygaret/autohighlight.vim'
```

Configuration
-------------

#### Idle Cursor Timeout
Auto-highlighting is triggered by the `CursorHold` event, which is itself triggered
when the cursor hasn't moved for `updatetime` milliseconds. You can reduce this time
from the default 4000 (4 seconds), like so:

```vim
:set updatetime=500 " only be idle on a word for 1/2 second.
```

#### Highlight Style
By default, current matches are simply underlined. You can change that by changing
the highlight group `CursorAutoHighlight`, like so:

```vim
:highlight CursorAutoHighlight guibg=red
```

#### Autoclear
Autoclearing can be turned on for 2 events.

To turn on autoclear when cursor is moved, enable the following option.
```
g:AutoHighlight_ClearOnCursorMoved = 1
```

To turn on autoclear when exiting a window, enable the following option.
```
g:AutoHighlight_ClearOnWindowExit = 1
```

#### Disabling AutoHighlight for certain buffers
In some buffers, AutoHighlight may not work, especially if the buffers are created by another plugin.
To disable auto highlight for some buffers, first find out the name of the buffer created by the other plugin.

To find out the name of the buffer, enter the buffer/window that the other plugin created, and type

```
echo @%
```
This will print out the name of the buffer, for example "ControlP" if run the command inside the ControlP buffer.

This will echo out the name of the buffer.
Add the name of the buffer, into the following global option.

```
let g:AutoHighlight_DisabledBuffers = "ControlP"
```

Multiple values can be added, by separating them with a comma.

License
-------

This plugin is released under the GPLv3 license. See [LICENSE][].

[Vundle]: https://github.com/gmarik/vundle
[LICENSE]: ./license.md
