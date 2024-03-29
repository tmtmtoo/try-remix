create table users (
    id uuid primary key
);

create table user_profile (
    id uuid primary key,
    user_id uuid not null,
    email text not null,
    name text,
    created_at timestamp not null default current_timestamp,

    constraint fk_user_profile_user foreign key (user_id) references users (id)
);

create index idx_user_profile_email on user_profile using btree (email);

create table user_delete (
    id uuid primary key,
    user_id uuid not null,
    created_at timestamp not null default current_timestamp,

    constraint fk_user_delete_user foreign key (user_id) references users (id)
);

create table organizations (
    id uuid primary key
);

create table organization_profile (
    id uuid primary key,
    organization_id uuid not null,
    name text not null,
    created_at timestamp not null default current_timestamp,

    constraint fk_organization_profile_organization foreign key (
        organization_id
    ) references organizations (id)
);

create table organization_delete (
    id uuid primary key,
    organization_id uuid not null,
    created_at timestamp not null default current_timestamp,

    constraint fk_organization_delete_organization foreign key (
        organization_id
    ) references organizations (id)
);

create table belong (
    id uuid primary key,
    user_id uuid not null,
    organization_id uuid not null,
    created_at timestamp not null default current_timestamp,

    constraint fk_belong_user foreign key (user_id) references users (id),
    constraint fk_belong_organization foreign key (
        organization_id
    ) references organizations (id)
);

create table dismiss (
    id uuid primary key,
    belong_id uuid not null,
    created_at timestamp not null default current_timestamp,

    constraint fk_dismiss_belong foreign key (belong_id) references belong (id)
);

create table roles (
    name text primary key,
    example boolean not null default false
);

create table assign (
    id uuid primary key,
    role_name text not null,
    belong_id uuid not null,
    created_at timestamp not null default current_timestamp,

    constraint fk_assign_role foreign key (role_name) references roles (name),
    constraint fk_assign_belong foreign key (belong_id) references belong (id)
);
