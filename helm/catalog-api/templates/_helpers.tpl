{{- define "catalog-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "catalog-api.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "catalog-api.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "catalog-api.labels" -}}
app.kubernetes.io/name: {{ include "catalog-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
