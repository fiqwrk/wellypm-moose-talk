package Role::BreathLogger;
use Moose::Role;
use MooseX::FollowPBP;
use Log::Any qw($log);

# interface style contract
requires 'get_breath_count';

has 'logger' => (
  is      => 'ro',
  default => sub { $log },
);

sub log {
  my $self = shift;
  my $count = $self->get_breath_count;
  $self->get_logger->info("Breaths: $count");
}

no Moose;
1;
