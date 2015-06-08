module ContactsHelper

  def timestamp(contact)
    "Created at #{time_ago_in_words(contact.created_at)}"
  end

end
