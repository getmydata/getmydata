class EmailProcessor
  def self.process(email)
    Post.create!({ body: email.body, email: email.from })
  end
end
