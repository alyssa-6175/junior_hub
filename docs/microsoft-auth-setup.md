# Microsoft sign-in setup

Junior Hub uses Firebase Authentication's Microsoft provider. The client app
limits sign-in to the Eastside Preparatory School Entra tenant:

`b2681e8b-dd20-46cf-b163-371a2d7c6014`

The `AADSTS700016` error mentioning application identifier `common` is a
server-side provider configuration problem. In particular, it means Azure
received `common` as the OAuth **client ID**. `common` is a tenant selector,
not an application (client) ID, so it must not be entered in Firebase's
Microsoft provider configuration.

An administrator should complete these steps:

1. In Microsoft Entra admin center, register a **single-tenant** application
   for the Eastside tenant above.
2. In that registration, add the Firebase OAuth redirect URI shown in Firebase
   Console: **Authentication → Sign-in method → Microsoft**. Copy it exactly;
   it normally uses the project's `firebaseapp.com` auth handler.
3. Create a client secret and keep its value private.
4. In Firebase Console for `juniorhub-bd73d`, enable the Microsoft provider.
   Paste the Entra application's real **Application (client) ID** in Client ID
   and the client-secret value in Client secret. Do not enter `common` in
   either field.
5. In Firebase Authentication → Settings → Authorized domains, confirm the
   production Hosting domain is listed.

The application registration and Firebase provider secret are intentionally
not stored in this repository. After the administrator saves the Firebase
provider settings, deploy the current web build and test with an
`@eastsideprep.org` account.
