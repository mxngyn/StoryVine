<i class="icon-pencil"></i>Story Vine
===================

Team Members
-------------
* **Team Lead:** Pearl Shin
* Alex Tarkowski
* Dionne Stanfield
* Mai Nguyen

About
----------
Story Vine is a writing web app that serves a community of writers to share ideas and write stories. It was inspired by the fact that most works of literature have started out as a simple idea, like a seed. This app provides a place for writers to share an idea in the form of a snippet whether it be a dream, a memory, or perhaps a random thought, and watch them come to life through stories.

Story Vine was built with Rails, Joint JS, Redactor JS, PostgreSQL, Solr, and Foundation.

----------

#### Setting up Solr
- make sure gem file includes: gem 'sunspot_rails' and gem 'sunspot_solr'
- rails generate sunspot_rails:install
- bundle exec rake sunspot:solr:start
- bundle exec rake sunspot:reindex (will make already existing entries in the database searchable.)




