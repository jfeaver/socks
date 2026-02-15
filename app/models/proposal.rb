class Proposal < ApplicationRecord
  # A proposed match links two socks before a final match is created.
  belongs_to :sock
  belongs_to :proposed_sock, class_name: "Sock"
end
