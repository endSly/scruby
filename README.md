Scruby
======

Install
-------

```ruby
gem 'scruby', github: 'endSly/scruby'
```

Example
-------

```ruby
class WishlistSpider < Scruby::Spider
  def initialize(marketplace, token)
    @marketplace, @token = marketplace, token
  end

  def start_url
    "http://#{ @marketplace.domain }/registry/wishlist/#{ @token }"
  end

  def parse(document)
    products = document.css('div.g-items-section > div[id^=item_]')
    emit(ProductSpider, products)
  end
end


class ProductSpider < Scruby::Spider
  def parse(item)
    price = item.css('span[id^=itemPrice_]').text
    token = item['id'].scan(/item_(\w+)/).last.last

    Product.find_or_create_by(token: token) do |product|
      product.name = item.css('h5').text.strip
      product.image_url = item.css('div[id^=itemImage_] img').attr('src')
    end
  end
end
```
