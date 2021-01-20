package ColorTheme::Distinct::WhiteBG;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict 'subs', 'vars';
use warnings;
use parent 'ColorThemeBase::Base';

our @colors = (
    'ff0000', # red
    '0000ff', # blue
    '00ff00', # green
    'ffff00', # yellow
    '000000', # black

    'ff00ff', # magenta
    '00ffff', # cyan
    'ff8000', # orange
    '606060', # darkgray

    'ffa0a0', # pink
    'a0a0ff', # light blue
    'a0ffa0', # light green
    'c0c0c0', # light gray
);

our %THEME = (
    v => 2,
    summary => 'Pick some distinct colors (that are suitable for white background) for you',
    description => <<'_',

This is suitable when you want to have different colors for several (like 5 or
10) items, e.g. in line or bar charts.

_
    dynamic => 1,
    args => {
        n => {
            summary => 'Number of colors',
            schema => ['int*', between=>[1, 0+@colors]],
            req => 1,
            pos => 0,
        },
    },
    examples => [
        {
            summary => 'Show 5 distinct colors you can use as, say, chart color',
            args => {n=>5},
        },
    ],
);

sub new {
    my $class = shift;
    my %args = @_;

    if (!$args{n}) { die "Please specify a positive n" }
    if ($args{n} >= @colors) { die "There are only ".(0+@colors)." colors in the theme, please specify n not greater than this" }

    my $self = $class->SUPER::new(%args);
    $self;
}

sub list_items {
    my $self = shift;

    my @list = 1 .. $self->{args}{n};
    wantarray ? @list : \@list;
}

sub get_item_color {
    my ($self, $name, $args) = @_;
    $colors[$name+0];
}

1;
# ABSTRACT:

=head1 SEE ALSO

L<ColorTheme::Distinct::BlackBG>

L<Acme::CPANModules::CreatingPaletteOfVisuallyDistinctColors>

Other C<ColorTheme::*> modules.
