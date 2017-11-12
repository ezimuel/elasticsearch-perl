package Search::Elasticsearch::Plugin::XPack::5_0::Security;

use Moo;
with 'Search::Elasticsearch::Plugin::XPack::5_0::Role::API';
with 'Search::Elasticsearch::Role::Client::Direct';
use namespace::clean;

__PACKAGE__->_install_api('xpack.security');

1;

# ABSTRACT: Plugin providing Security API for Search::Elasticsearch 5.x

=head1 SYNOPSIS

    use Search::Elasticsearch();

    my $es = Search::Elasticsearch->new(
        nodes    => \@nodes,
        plugins  => ['XPack'],
        userinfo => "username:password"
    );

    my $response = $es->xpack->security->authenticate();

=head2 DESCRIPTION

This class extends the L<Search::Elasticsearch> client with a C<security>
namespace, to support the
L<Security APIs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api.html>.
In other words, it can be used as follows:

    use Search::Elasticsearch();
    my $es = Search::Elasticsearch->new(
        nodes    => \@nodes,
        plugins  => ['XPack'],
        userinfo => "username:password"
    );

    my $response = $es->xpack->security->authenticate(...);

The full documentation for the Security feature is available here:
L<https://www.elastic.co/guide/en/x-pack/current/xpack-security.html>

=head1 GENERAL METHODS

=head2 C<authenticate()>

    $response = $es->xpack->security->authenticate()

The C<authenticate()> method checks that the C<userinfo> is correct and returns
a list of which roles are assigned to the user.

See the L<authenticate docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-authenticate.html>
for more information.

Query string parameters:
    C<error_trace>,
    C<human>

=head2 C<clear_cached_realms()>

    $response = $es->xpack->security->clear_cached_realms(
        realms => $realms       # required  (comma-separated string)
    );

The C<clear_cached_realms()> method clears the caches for the specified realms

Query string parameters:
    C<error_trace>,
    C<human>,
    C<usernames>

See the L<clear_cached_realms docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-clear-cache.html>
for more information.


=head1 USER METHODS

=head2 C<put_user()>

    $response = $es->xpack->security->put_user(
        username => $username,     # required
        body     => {...}          # required
    );

The C<put_user()> method creates a new user or updates an existing user.

See the L<User Management docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-users.html>
for more information.

Query string parameters:
    C<error_trace>,
    C<human>

=head2 C<get_user()>

    $response = $es->xpack->security->get_user(
        username => $username | \@usernames     # optional
    );

The C<get_user()> method retrieves info for the specified users (or all users).

See the L<User Management docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-users.html>
for more information.

Query string parameters:
    C<error_trace>,
    C<human>

=head2 C<delete_user()>

    $response = $es->xpack->security->delete_user(
        username => $username       # required
    );

The C<delete_user()> method deletes the specified user.

See the L<User Management docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-users.html>
for more information.

Query string parameters:
    C<error_trace>,
    C<human>

=head2 C<change_password()>

    $response = $es->xpack->security->change_password(
        username => $username       # optional
        body => {
            password => $password   # required
        }
    )

The C<change_password()> method changes the password for the specified user.

See the L<User Management docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-users.html>
for more information.

=head2 C<disable_user()>

    $response = $es->xpack->security->disable_user(
        username => $username       # required
    );

The C<disable_user()> method disables the specified user.

See the L<User Management docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-users.html>
for more information.

Query string parameters:
    C<error_trace>,
    C<human>

=head2 C<enable_user()>

    $response = $es->xpack->security->enable_user(
        username => $username       # required
    );

The C<enable_user()> method enables the specified user.

See the L<User Management docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-users.html>
for more information.

Query string parameters:
    C<error_trace>,
    C<human>

=head1 ROLE METHODS

=head2 C<put_role()>

    $response = $es->xpack->security->put_role(
        name => $name,             # required
        body     => {...}          # required
    );

The C<put_role()> method creates a new role or updates an existing role.

See the L<Role Management docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-roles.html>
for more information.

Query string parameters:
    C<error_trace>,
    C<human>

=head2 C<get_role()>

    $response = $es->xpack->security->get_role(
        name => $name | \@names     # optional
    );

The C<get_role()> method retrieves info for the specified roles (or all roles).

See the L<Role Management docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-roles.html>
for more information.

Query string parameters:
    C<error_trace>,
    C<human>

=head2 C<delete_role()>

    $response = $es->xpack->security->delete_role(
        name => $name       # required
    );

The C<delete_role()> method deletes the specified role.

See the L<Role Management docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-roles.html>
for more information.

Query string parameters:
    C<error_trace>,
    C<human>

=head2 C<clear_cached_roles()>

    $response = $es->xpack->security->clear_cached_roles(
        names => $names       # required  (comma-separated string)
    );

The C<clear_cached_roles()> method clears the caches for the specified roles.

See the L<Role Management docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-roles.html>
for more information.

Query string parameters:
    C<error_trace>,
    C<human>


=head1 ROLE MAPPING METHODS

=head2 C<put_role_mapping()>

    $response = $es->xpack->security->put_role_mapping(
        name => $name,             # required
        body     => {...}          # required
    );

The C<put_role_mapping()> method creates a new role mapping or updates an existing role mapping.

See the L<Role Mapping docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-role-mapping.html>
for more information.

Query string parameters:
    C<error_trace>,
    C<human>

=head2 C<get_role_mapping()>

    $response = $es->xpack->security->get_role_mapping(
        name => $name,             # optional
    );

The C<get_role_mapping()> method retrieves one or more role mappings.

See the L<Role Mapping docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-role-mapping.html>
for more information.

Query string parameters:
    C<error_trace>,
    C<human>

=head2 C<delete_role_mapping()>

    $response = $es->xpack->security->delete_role_mapping(
        name => $name,             # required
    );

The C<delete_role_mapping()> method deletes a role mapping.

See the L<Role Mapping docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-role-mapping.html>
for more information.

Query string parameters:
    C<error_trace>,
    C<human>

=head1 TOKEN METHODS

=head2 C<get_token()>

    $response = $es->xpack->security->get_token(
        body     => {...}          # required
    );

The C<get_token()> method enables you to create bearer tokens for access without
requiring basic authentication.

See the L<Token Management docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-tokens.html>
for more information.

Query string parameters:
    C<error_trace>,
    C<human>

=head2 C<invalidate_token()>

    $response = $es->xpack->security->invalidate_token(
        body     => {...}          # required
    );

The C<invalidate_token()> method enables you to invalidate bearer tokens for access without
requiring basic authentication.

See the L<Token Management docs|https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-tokens.html>
for more information.

Query string parameters:
    C<error_trace>,
    C<human>

