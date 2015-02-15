module Flagging

  def flag(user_id)
    Flag.create(flaggable: self, flagged: true, user_id: user_id)
  end

end
