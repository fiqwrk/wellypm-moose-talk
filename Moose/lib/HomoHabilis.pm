use Moops;
use Ape;

class HomoHabilis extends Ape {
  has 'grunt' => (
      is => 'rw',
      isa => 'Bool',
      default => 1,
      predicate => 'can_grunt',
  );

  # private - well I hate calling anything private in default
  # moose, as it's not.
  # you can still call $object->_rage externally
  # bet there's a moosex for that which checks caller()
  has '_rage' => ( is => 'rw', isa => 'Bool', default=>1 );

  # public - well everything is
  has 'xp' => ( is => 'rw', isa => 'Int', default=>100 );

  method adjust_xp( Int $value ) {
      $self->xp( $self->xp + $value );
  } 

  method hit_noisy_ape( HomoHabilis $target  where {$_->can_grunt} ) {
      if ($self->_rage) {
          $target->adjust_xp( -10 );
          $self->adjust_xp( +10 );
      }
  }  
}

