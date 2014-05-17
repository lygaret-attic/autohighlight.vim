Vim AutoHighlight
=================

This plugin will automatically highlight the word currently under the cursor 
in the current window. This allows you to more easily see where words are
being used, (eg. variable usages, etc.)

Plea For Suggestions
--------------------

**NOTE** This plugin is my first attempt at an actual packaged up vim plugin,
and hence I'm absolutely sure there's a billion and four things missing. Please,
please file issues to tell me what I've messed up. Pull requests are even better!

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

License
-------

This plugin is released under the GPLv3 license. See [LICENSE][].

[Vundle]: https://github.com/gmarik/vundle
[LICENSE]: ./license.md
