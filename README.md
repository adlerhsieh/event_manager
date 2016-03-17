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

### member routes

1. `routes.rb`
```
resources :events do
  member do
    post :join
    post :withdraw
  end
end
```

2. `app/views/events/show.html.erb`

```html
<%= button_to "Join", join_event_path(@event) %>
<%= button_to "Withdraw", withdraw_event_path(@event) %>
```

3. CLI

```
rails g model user username:string
rails g model membership event_id:integer user_id:integer
rake db:migrate
```

```
rails c
User.create(:username => "John")
```

4. `user.rb`

```ruby
has_many :events, through: :memberships
has_many :memberships
```

5. `membership.rb`

```ruby
belongs_to :event
belongs_to :user
```

6. `event.rb`

```ruby
has_many :users, through: :memberships
has_many :memberships
```

7. `events_controller.rb`

```ruby
def current_user
  User.first
end
```

8. `events_controller.rb`

```ruby
def join
  @event = Event.find(params[:id])
  Membership.find_or_create_by(:event => @event, :user => current_user)
  redirect_to :back
end

def withdraw
  @event = Event.find(params[:id])
  @membership = Membership.find_by(:event => @event, :user => current_user)
  @membership.destroy if @membership
  redirect_to :back
end
```

9. `app/views/events/show.html.erb`

```html
<% @event.users.each do |user| %>
  <p><%= user.username %></p>
<% end %>
```
