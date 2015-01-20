class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, type: String

  belongs_to :post

    def date_published
 	created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end

  validates :body, presence: true
end
