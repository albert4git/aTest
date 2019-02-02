
When I have g:easytags_async=0, everything works just fine. However, when I
turn it on, the tags never actually get updated (i.e. running :UpdateTags does
not alter the tags file), but there are no warnings or errors that I can see.

I added configuration:

let g:easytags_languages = {'ruby': {'cmd': 'ripper-tags'}}

But this doesn't seem to work. Is there a way to use ripper for ruby files?

:HighlightTags may cause Vim to become very slow. There should be a way to undo it.
