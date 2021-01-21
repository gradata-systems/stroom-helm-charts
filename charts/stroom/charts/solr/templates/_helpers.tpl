{{/*
Expand the name of the chart.
*/}}
{{- define "solr.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "solr.fullname" -}}
{{- $chart := .Values.global.solr }}
{{- printf "%s-%s" .Release.Name $chart.chartId | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "solr.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "solr.labels" -}}
helm.sh/chart: {{ include "solr.chart" . }}
{{ include "solr.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{ include "stroom.extraLabels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "solr.selectorLabels" -}}
app.kubernetes.io/name: {{ include "solr.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
