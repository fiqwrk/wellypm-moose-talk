package Person;
use Moose;
use MooseX::FollowPBP;
use DateTime;
extends 'Ape';


has 'breath_count' => ( is => 'rw',
			isa => 'Int',
			default => 0 );


has 'name' => ( is      => 'ro',          #read only
                isa     => 'Str',         #string
		default => 'John Doh', ); #mandatory

has 'age'  => ( is => 'rw', isa => 'Int' );

has 'year_of_birth' => ( is => 'rw', isa => 'Int',
                         lazy_build      => 1, );

with 'Role::BreathLogger';

# derive birth year from age
sub _build_year_of_birth {
  my $self = shift;

  DateTime->now()->subtract(
    years => $self->get_age )->year;
}


no Moose;
1;



