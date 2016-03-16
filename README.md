### Block

```ruby
start do

end

start do |i|

end

(1..10).each do |n|
  puts n
end

resources :events do
  resource :location
end

Rails::Application.configure do |config|
  config.time_zone = 'Asia/Taipei'
end

<% @attendees.each do |attendee| %>
  <%= attendee.name %>
<% end %>
```

### Variable

```ruby
variable
method
@instance_variable

@i # => nil
@i = 10
@i # => 10

variable # => undefined local variable or method `variable'`
method   # => undefined local variable or method `method`
```

### Error Messages

```ruby
@event.name # => "Undefined method `name` for nil:NilClass"
# Routes => Controller => View
# Columns
# has_many, belongs_to
```

### Object Attribute

```ruby
class Foo
  attr_accessor :bar

  def initialize

  end

  def set_bar
    @bar = "foobar"
  end
end

foo = Foo.new
foo.bar # => nil
foo.set_bar
foo.bar # => "foobar"

# =======

def setup_event(event)
  event.build_location unless event.location
  event
end
```

### Hash as Attribute

```ruby
def render_hash(hash)
  puts hash[:foo]
  puts hash[:bar]
end

render_hash({:foo => "foobar", :bar => "foobar"})

render_hash(:foo => "foobar", :bar => "foobar")

render_hash(foo: "foobar", bar: "foobar")

render_hash foo: "foobar", bar: "foobar"

```
