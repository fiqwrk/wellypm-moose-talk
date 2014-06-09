package Role::BreathLogger;
use Moose::Role;
use MooseX::FollowPBP;
use Log::Dispatch::Screen;

# interface style contract
requires qw(breath get_breath_count);

has 'logger' => (
  is      => 'ro',
  default => sub { Log::Dispatch->new(
	outputs => [[ 'Screen', min_level => 'debug' ]] )
  },
);

sub log {
  my $self = shift;
  my $count = $self->get_breath_count;
  $self->get_logger->debug("Breaths: $count");
}

before 'breath' => sub {
  my $self = shift;
  $self->get_logger->debug("Inhale");
};

after 'breath' => sub {
  my $self = shift;
  $self->get_logger->debug("Exhale");
};


1;



no Moose;
1;
