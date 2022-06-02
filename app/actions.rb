# W2D2: Introducing Control Flow & if Statements to print humanized string of time
#
# get '/' do
#   username = "sharky_j"
#   avatar_url = "http://naserca.com/images/sharky_j.jpg"
#   photo_url = "http://naserca.com/images/shark.jpg"
#   time_ago_in_minutes = 5
#   like_count = 0
#   comment_count = 1
#   comments = [
#     "sharky_j: Out for the long weekend... too embarrassed to show y'all the beach bod!"
#   ]

#   if time_ago_in_minutes >= 60
#     "#{time_ago_in_minutes / 60} hours ago"
#   else
#     "#{time_ago_in_minutes} minutes ago"
#   end
# end

# W2D2: Defining a Method to print humanized string of time

def humanized_time_ago(minute_num)
  if minute_num >= 60
    "#{minute_num / 60} hours ago"
  else
    "#{minute_num} minutes ago"
  end
end

# Using variables
#
# get '/' do
#   username = "sharky_j"
#   avatar_url = "http://naserca.com/images/sharky_j.jpg"
#   photo_url = "http://naserca.com/images/shark.jpg"
#   time_ago_in_minutes = 15
#   like_count = 0
#   comment_count = 1
#   comments = [
#     "sharky_j: Out for the long weekend... too embarrassed to show y'all the beach bod!"
#   ]

#   humanized_time_ago(time_ago_in_minutes)

# end

# Using hashes

get '/' do
  finstagram_post_shark = {
    username: "sharky_j",
    avatar_url: "http://naserca.com/images/sharky_j.jpg",
    photo_url: "http://naserca.com/images/shark.jpg",
    # putting the value that the method returns into a hash
    humanized_time_ago: humanized_time_ago(15),
    like_count: 0,
    comment_count: 1,
# previously - comment array, not as simplified with a username and text hash
#    comments: [
#      "sharky_j: Out for the long weekend... too embarrassed to show y'all the beach bod!"
#    ]
    # now - comments hash with an array of one element which has two hashes
    comments: [{
      username: "sharky_j",
      text: "Out for the long weekend... too embarrassed to show y'all the beach bod!"
    }]
  }

  finstagram_post_whale = {
    username: "kirk_whalum",
    avatar_url: "http://naserca.com/images/kirk_whalum.jpg",
    photo_url: "http://naserca.com/images/whale.jpg",
    humanized_time_ago: humanized_time_ago(65),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "kirk_whalum",
      text: "#weekendvibes"
    }]
  }

  finstagram_post_marlin = {
    username: "marlin_peppa",
    avatar_url: "http://naserca.com/images/marlin_peppa.jpg",
    photo_url: "http://naserca.com/images/marlin.jpg",
    humanized_time_ago: humanized_time_ago(190),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "marlin_peppa",
      text: "lunchtime! ;)"
    }]
  }
  # putting hashes into a single array, where to_s turns it into a string
  [finstagram_post_shark, finstagram_post_whale, finstagram_post_marlin].to_s
end