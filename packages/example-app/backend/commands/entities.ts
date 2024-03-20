import { uuidv7 } from "uuidv7";
import {
  DisplayName,
  Email,
  OrganizationId,
  Role,
  UserId,
  displayName,
  organizationId,
  userId,
} from "./values";

export type User = {
  id: UserId;
  email: Email;
  displayName?: DisplayName;
  organizations: {
    id: OrganizationId;
    displayName: DisplayName;
    role: Role;
    authorityExample?: boolean;
  }[];
};

export const createUserWithDefaultOrganization = (
  email: Email,
  _userId?: UserId,
  _organizationId?: OrganizationId,
): User => ({
  id: _userId ? _userId : userId(uuidv7())._unsafeUnwrap(),
  email,
  organizations: [
    {
      id: _organizationId
        ? _organizationId
        : organizationId(uuidv7())._unsafeUnwrap(),
      displayName: displayName("My First Organization")._unsafeUnwrap(),
      role: "admin",
    },
  ],
});
