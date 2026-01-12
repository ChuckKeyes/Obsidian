Google Cloud Managed Service for Prometheus (GMP) is a fully managed, multi-cloud, and cross-project solution for collecting, storing, and querying Prometheus metrics within Google Cloud. It allows users to leverage the power of Prometheus and PromQL for monitoring and alerting without the operational overhead of managing Prometheus infrastructure at scale. 
Key features and benefits of GMP include:
Managed Collection and Storage: GMP handles the collection and storage of Prometheus metrics, leveraging Google's globally scalable Monarch data store, which powers all application monitoring at Google.
PromQL Compatibility: Users can continue to use existing Grafana dashboards, PromQL-based alerts, and workflows, ensuring portability and a seamless transition from self-managed Prometheus.
Hybrid and Multi-Cloud Support: GMP can monitor workloads across various environments, including Kubernetes (GKE, GKE on AWS, GKE on Azure), VMs, and serverless applications like Cloud Run.
Long-term Data Retention: It offers 24 months of metric data retention by default.
Integration with Cloud Monitoring: Users can query over 6,500 free metrics in Cloud Monitoring, including free GKE system metrics, using PromQL, alongside their Prometheus metrics. 
Managed Rule Evaluation and Alerting: GMP provides a compatible interface for Prometheus rules, enabling the seamless migration and evaluation of existing rules within the managed service.
Reduced Operational Overhead: It eliminates the need for manual tasks such as sharding Prometheus servers, managing complex scrape configurations, and scaling Prometheus infrastructure.

Wire Grafana → Managed Prometheus (required)

Grafana can’t natively do OAuth2 for Prometheus; Google provides a data source syncer that keeps a Grafana Prometheus datasource pointed at the Cloud Monitoring Prometheus API with fresh OAuth tokens. Deploy the syncer using the official method (Cloud Run + Cloud Scheduler is the cleanest), then point it at your Grafana VM and service account. Step-by-step is here: “Query using Grafana” for GMP. 
Google Cloud

(If you prefer, you can run the syncer near Grafana in Kubernetes as a CronJob; both paths are documented. 
Google Cloud
)

Why this matches “Managed Prometheus in GCP”

No Prometheus server VM. The OTel Collector scrapes your exporters and exports to GMP via googlemanagedprometheus. That’s the supported pattern on VMs. 
Google Cloud
+1

Grafana pulls from GMP using data source syncer (OAuth2 → Cloud Monitoring Prometheus API). 
Google Cloud

After terraform apply

Visit:

Media: http://MEDIA_IP:8096

Grafana: http://GRAFANA_IP:3000 (admin / admin123 – change it)

Deploy the data source syncer so Grafana can query GMP (select Cloud Run + Scheduler). 
Google Cloud

In Metrics Explorer, you can also verify your Prom metrics (look for Prometheus metrics ingested via GMP). 
Google Cloud

Extras (optional)

Add more scrape targets in /opt/gmp/otel-collector.yaml under scrape_configs (e.g., add Grafana VM’s node_exporter at GRAFANA_INTERNAL_IP:9100).

If you want to collect Prom metrics on each VM without editing the collector’s static targets, you can run an Ops Agent with Prometheus receiver on the VMs; it’s documented for GCE. (For GMP queries, stick with the Collector+GMP exporter pattern or self-deployed collection). 
Google Cloud

If you want me to auto-template the internal IP discovery and add blackbox checks or Alertmanager (also via GMP rules), say the word and I’ll drop those in.