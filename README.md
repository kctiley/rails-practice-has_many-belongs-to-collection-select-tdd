## test driven has_many / belongs_to, collection select

* Install rspec-rails, capybara
* Write a test to force you to write the code you want to see in the world:
  * Each Cat show page should list the toys that cat owns.
  * Toy index page should list the cat that owns each of the toys listed.
  * Toy show page should list the cat that owns that toy (toys are not shared).
  * Toy new page should have a collection select for all Cats.
  * Toy new page should create a new toy and cat ownership and list it on the index.
