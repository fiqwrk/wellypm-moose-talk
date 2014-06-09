package TVShow;
use Moose;

has 'title' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);
has 'guide' => (
    is         => 'ro',
    isa        => 'WWW::EZTV::Show',
    lazy_build => 1,
    handles    => {
        get_episodes      => 'episodes',
        get_episode_count => 'has_episodes',
        find_episode      => 'find_episode'
    },
);

sub _build_guide {
    my $self = shift;
    my $title = shift;
    WWW::EZTV->new->find_show(
      sub { $_->name =~ /$title/i } );
}
no Moose;
1;


