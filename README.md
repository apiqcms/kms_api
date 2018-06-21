## KMS Models

[![Build Status](https://travis-ci.org/apiqcms/kms_models.svg?branch=master)](https://travis-ci.org/apiqcms/kms_models)
[![Code Climate](https://codeclimate.com/github/apiqcms/kms_models/badges/gpa.svg)](https://codeclimate.com/github/apiqcms/kms_models)

This extension adds "Models" section in [KMS](https://github.com/apiqcms/kms) and allows to define custom models on-the-fly. Supported fields for definition in Model: String, Text, Checkbox, File, HasMany, BelongsTo. Note that this extension requires at least PostgreSQL 9.2 because of JSON column type.

## Installation

1. Add to Gemfile

        gem "kms_api"
        # or for edge version:
        gem "kms_api", github: "webgradus/kms_api"

2. Bundle:

        bundle install

3. Run generator:

        rails g kms_api:install

4. Bundle again:

        bundle install

5. Restart KMS instance
