# Ruby solution for Gilded Rose Kata

Set up:

    $ bundle install
    $ guard

Run tests:

    $ rspec spec/gilded_rose_spec.rb

You can edit `require` line at the top of `spec/gilded_rose_spec.rb` to load proper GildedRose class like:
You can choose required file by changing `GILDED_ROSE_FILE` constant in `spec/spec_helper.rb`

* `gilded_rose.rb` - not refactored code, your starting point :)
* `gilded_rose_refactored_1.rb` - just example with first refactored code and implemented Conjured item, it's still not good enough
* `gilded_rose_refactored_2.rb` - second example of refactored code, it has a lot of extracted small objects
* `gilded_rose_refactored_by_ania.rb` - my working refactor :)

__Use as your starting point the `gilded_rose.rb` and ensure you run spec for it (see `require` at the top of spec file). Don't look at refactored examples - try it yourself first.__

# Golden Master Testing

File `golden_master.txt` contains recorded output for `texttext_fixture.rb` without `Conjured Mana Cake` item which is not implemented in original `GildedRose` class.

Run `rspec spec/golden_master_spec.rb` to see if `GildedRose` class passes the golden master spec.

After you implement new feature, replace `golden_master.txt` with `golden_master.txt.with_conjured`
