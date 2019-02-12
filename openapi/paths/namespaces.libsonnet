// Copyright © 2019 Titan Distribution Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

local example = import '../../schema/namespace/golden.libsonnet';
local schema = import '../../schema/namespace/namespace.libsonnet';
local params = import '../parameters.libsonnet';
local resp = import '../responses.libsonnet';

local mediaType = {
  namespace:: 'application/vnd.titan-distribution.namespace.v1+json',
  createNamespace:: 'application/vnd.titan-distribution.namespace.create.v1+json',
};

local getNamespace = {
  tags: ['namespaces'],
  operationId: 'getNamespace',
  responses: resp.baseResponses {
    '200': {
      description: 'OK',
      content: {
        [mediaType.namespace]: {
          schema: schema.namespace('openapi'),
          example: example.namespace,
        },
      },
    },
  },
};

local putNamespace = {
  tags: ['namespaces'],
  operationId: 'createNamespace',
  responses: resp.baseResponses,
  requestBody: {
    required: true,
    content: {
      [mediaType.createNamespace]: {
        schema: schema.createNamespace('openapi'),
        example: example.createNamespace,
      },
    },
  },
};

local deleteNamespace = {
  tags: ['namespaces'],
  operationId: 'deleteNamespace',
  responses: resp.baseResponses,
};

local singularPathItems = {
  parameters: [params.namespace],
  get: getNamespace,
  put: putNamespace,
  delete: deleteNamespace,
};

{
  '/namespaces/{namespace}': singularPathItems,
}
