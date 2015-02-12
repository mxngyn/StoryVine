class Vote < ActiveRecord::Base

  belongs_to :story
  belongs_to :user

  # Add validation to make sure that a user can only vote on a story once.

end
