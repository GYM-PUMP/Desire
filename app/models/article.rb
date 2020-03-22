class Article < ApplicationRecord
	attachment :article_image
	is_impressionable counter_cache: true
end
