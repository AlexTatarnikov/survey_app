class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :year
end
