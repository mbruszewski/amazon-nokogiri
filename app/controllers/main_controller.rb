require 'open-uri'

class MainController < ApplicationController
  def index
  end

  def navigate
    path          = params[:path][:path]
    doc           = Nokogiri::HTML(open(path))
    # get author from html
    author        = Author.get_author doc
    # get album from html
    album         = Album.get_album author, doc

    rev_sum_path  = doc.at_css("#revSum .a-fixed-left-grid-col a").attr("href")
    reviews       = Nokogiri::HTML(open(rev_sum_path))

    # get review div
    rev_helper    = reviews.at_css("#productReviews td div")
    # get 10 comments from page
    10.times do
      # get review information
      rev_title     = rev_helper.at_css("span b").text
      rev_desc      = rev_helper.at_css(".reviewText").text
      rev_mark      = rev_helper.at_css(".swSprite").text.split(" ")[0]
      # create review
      rev           = Review.create(title: rev_title, description: rev_desc, mark: rev_mark)
      # add review to album
      album.reviews << rev
      # scroll to next review
      7.times do
        rev_helper = rev_helper.next_sibling if rev_helper
      end
    end

    debugger
  end
end
