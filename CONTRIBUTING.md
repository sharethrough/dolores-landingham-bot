## Contributing

### Code of conduct

We aspire to create a welcoming environment for collaboration on this project.
To that end, we follow the [18F Code of
Conduct](https://github.com/18F/code-of-conduct/blob/master/code-of-conduct.md)
and ask that all contributors do the same.

### Git Protocol

To contribute to this project, people internal to 18F can create a branch and submit a pull request. If you are external to 18F, you can fork the repository and submit a pull request that way.

We are minimizing commits on the `master` branch by squashing commits and force pushing them to `master`. 

For a more detailed walk through on how to do this, you can read thoughtbot's [Git Protocol](https://github.com/thoughtbot/guides/tree/master/protocol/git#write-a-feature) document.

18f-ers can merge their changes into master after getting approval from another contributor.

### App setup

To get started, run `bin/setup`

After setting up, you can run the application using [foreman]:

    % foreman start

If you don't have `foreman`, see [Foreman's install instructions][foreman]. It
is [purposefully excluded from the project's `Gemfile`][exclude].

[foreman]: https://github.com/ddollar/foreman
[exclude]: https://github.com/ddollar/foreman/pull/437#issuecomment-41110407

The application will run locally at `http://localhost:5000/`

### Required keys

The setup script creates a `.env` file with a dummy environment configuration variables.
If you are internal to 18F and would like access to these configs,
you can contact Jessie Young. Otherwise, you can create a Slack bot
[here](https://18f.slack.com/services/new/bot).

### Authentication

You will need to be on the developer list to authenticate locally via MyUSA.
Contact Brian Hedberg to be added to the developer list.

## Deployment

Refer to [docs.18f.gov](https://docs.18f.gov/getting-started/setup/) for getting
set up with Cloud Foundry

The Dolores Landingham bot is deployed within the 18F org in Cloud Foundry. If
you do not already have access to the 18F org, you can request access by posting
an issue to the [DevOps repo](https://github.com/18F/DevOps/issues/new) on
GitHub.

Once you have access to the 18F org, you can target the Cloud Foundry
organization and space for this project:

`cf target -o 18f -s dolores`

Once your target is set, you can push the application. We have two Cloud Foundry 
instances: `dolores-app` and `dolores-staging`. 
Test your changes by pushing to `dolores-staging` before pushing to the 
`dolores-app` instance.

`cf push <app-instance-name>`

New migrations will be run automatically. See the [manifest](manifest.yml) for
more details on the Cloud Foundry setup.

To see existing environment variables:

`cf env <app-instance-name>`

To set or change the value of an environment variable:

`cf set-env <app-instance-name> <env-name> <env-value>`
