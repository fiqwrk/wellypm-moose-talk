package Person;
use Moose;
has 'name' => ( is => 'ro',       #read only
                isa => 'Str',     #string
                required => 1, ); #mandatory

has 'age'  => ( is => 'rw', isa => 'Int' ); 

1;

