<i class="icon-pencil"></i> Write Bulb / Story Vine
===================

Team Members
-------------
* **Team Lead:** Pearl Shin
* **Git Master:** Alex Tarkowski
* **Product Manager:** Dionne Stanfield
* **Front-end:** Mai Nguyen

----------

#### MVP User Stories

* As a user, I can sign in/out/up.
* As a user, I can view snippets by date, popularity, random.
* As a user, I can create snippets.
* As a user, I can create stories off of snippets.
* As a user, I can edit/delete my story.
* As a user, I can upvote/unvote stories.
* As a user, I can view stories without logging in.
* As a user, I can access a dashboard after logging in.

----------

#### Trello

* https://trello.com/b/DyWNow9X/write-bulb
* 

#### Setting up Solr
- make sure gem file includes: gem 'sunspot_rails' and gem 'sunspot_solr'
- rails generate sunspot_rails:install
- bundle exec rake sunspot:solr:start
- bundle exec rake sunspot:reindex (will make already existing entries in the database searchable.)




