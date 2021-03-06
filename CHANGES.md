# CHANGELOG
## 0.3.1
- Finally solved a large bug with a very simple fix. Looks
  like we're approaching stability, folks!

## 0.3.0
- Finally solved a large bug with a very simple fix. Looks
  like we're approaching stability, folks!

## 0.2.7
- So, about that library I arrogantly included? Turns out we
  should require it in code before expecting anything of it.

## 0.2.6
- We now use the BigSpoon library to hook into reload, because
  it's SO MUCH MORE AWESOME THAN THE GARBAGE MOST PEOPLE USE.
  Welp. It's been nice coding with y'all.

## 0.2.5
- PGCrypto now hooks into ActiveRecord::Base#reload in order to
  reset encrypted column values as expected when calling reload.

## 0.2.2
- Don't try to load columns on new records; should further reduce
  unnecessary database calls!

## 0.2.1
- Added ActiveModel::Dirty support, so you can now call *_changed?
  on your models tracking pgcrypto columns.

## 0.2.0
- Overhauled key system. Unfortunately, for performance reasons
  and due to the insanely hacked nature of PGCrypto, multiple keys
  are NO LONGER SUPPORTED. I'm working to bring them back, but
  this was the only solution to get fully performant and functional
  without any disasters.

## 0.1.2
- Added automatic installation of the pgcrypto extension if'n it
  doesn't already exist. Helpful, but doesn't fully make the 
  `rake db:test:prepare` cut yet. Still working on that bit...

## 0.1.1
- Rebuilt the WHERE clause stuff to make sure finders AND setters
  both worked. It's fragile and hackish at this time, but we'll get
  there, folks!

## 0.1.0
- Overhauled the underpinnings to rely on a separate column. Adds
  on-demand loading of encrypted attributes from a central table
  which provides dramatic speed improvements when a record's
  encrypted attributes aren't needed most of the time.

## 0.0.4
- Compatibility fix between ActiveRecord ## 3.2.1 and ## 3.2.2

## 0.0.3
- Fixed a join bug on SELECT statements

## 0.0.2
- Fixed a number of key-related bugs discovered in testing with our
  second production app with encrypted columns. Also duck-typed AREL
  statement types in a few places.

## 0.0.1
- INSERT, SELECT, and UPDATE statements are working. But I wrote this
  while testing with a production app, and thus haven't written
  specific tests, so don't get your panties in a twist.
