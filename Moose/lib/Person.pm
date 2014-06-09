package Person;
use Moose;
use MooseX::FollowPBP;
use DateTime;
extends 'Ape';

use MooseX::Method::Signatures;

method mind_meld_with(Person $subject, Int $depth) {
  $self->think_of( $subject->get_thought );
}

has 'thought' => ( is => 'rw', isa => 'Str', default => 'doh' );

has 'breath_count' => ( is => 'rw',
			isa => 'Int',
			default => 0 );


has 'name' => ( is      => 'ro',          #read only
                isa     => 'Str',         #string
		default => 'John Doh', ); #mandatory

has 'age'  => ( is => 'rw', isa => 'Int' );

has 'year_of_birth' => ( is => 'rw', isa => 'Int',
                         lazy_build      => 1, );

# consume role
with 'Role::BreathLogger';

sub breath {
  my $self = shift;
  $self->get_logger->debug("Wheeze");
  $self->set_breath_count( $self->get_breath_count+1 ); 
}

around 'think_of' => sub {
  my $target_method = shift;
  my $self = shift;
  my $args = shift;
  $self->get_logger->debug("Start thinking\n");
  my @thoughts = map{ $_ . " is great" } @$args;
  $self->$target_method(\@thoughts);
  $self->get_logger->debug("Done thinking\n");
};

sub think_of {
  my $self = shift;
  my $thoughts = shift;
  for (@$thoughts) {
    $self->get_logger->debug("Thinking of $_\n");
  }
}



# derive birth year from age
sub _build_year_of_birth {
  my $self = shift;

  DateTime->now()->subtract(
    years => $self->get_age )->year;
}


no Moose;
1;



