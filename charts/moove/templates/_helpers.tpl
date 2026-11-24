{{- define "moove.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "moove.labels" -}}
helm.sh/chart: {{ include "moove.chart" . }}
{{ include "moove.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "moove.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
