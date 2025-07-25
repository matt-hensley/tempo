local dashboard_utils = import 'dashboard-utils.libsonnet';
local g = import 'grafana-builder/grafana.libsonnet';

dashboard_utils {
  grafanaDashboards+: {
    'tempo-resources.json':
      $.dashboard('Tempo / Resources')
      .addClusterSelectorTemplates()
      .addRow(
        g.row('Gateway')
        .addPanel(
          $.containerCPUUsagePanel('CPU', $._config.jobs.gateway),
        )
        .addPanel(
          $.containerMemoryWorkingSetPanel('Memory (workingset)', $._config.jobs.gateway),
        )
        .addPanel(
          $.goHeapInUsePanel('Memory (go heap inuse)', $.jobMatcher($._config.jobs.gateway)),
        )
      )
      .addRow(
        g.row('Distributor')
        .addPanel(
          $.containerCPUUsagePanel('CPU', $._config.jobs.distributor),
        )
        .addPanel(
          $.containerMemoryWorkingSetPanel('Memory (workingset)', $._config.jobs.distributor),
        )
        .addPanel(
          $.goHeapInUsePanel('Memory (go heap inuse)', $.jobMatcher($._config.jobs.distributor)),
        )
      )
      .addRow(
        g.row('Ingester')
        .addPanel(
          $.containerCPUUsagePanel('CPU', $._config.jobs.ingester),
        )
        .addPanel(
          $.containerMemoryWorkingSetPanel('Memory (workingset)', $._config.jobs.ingester),
        )
        .addPanel(
          $.goHeapInUsePanel('Memory (go heap inuse)', $.jobMatcher($._config.jobs.ingester)),
        )
      )
      .addRow(
        g.row('Metrics-generator')
        .addPanel(
          $.containerCPUUsagePanel('CPU', $._config.jobs.metrics_generator),
        )
        .addPanel(
          $.containerMemoryWorkingSetPanel('Memory (workingset)', $._config.jobs.metrics_generator),
        )
        .addPanel(
          $.goHeapInUsePanel('Memory (go heap inuse)', $.jobMatcher($._config.jobs.metrics_generator)),
        )
      )
      .addRow(
        g.row('Query Frontend')
        .addPanel(
          $.containerCPUUsagePanel('CPU', $._config.jobs.query_frontend),
        )
        .addPanel(
          $.containerMemoryWorkingSetPanel('Memory (workingset)', $._config.jobs.query_frontend),
        )
        .addPanel(
          $.goHeapInUsePanel('Memory (go heap inuse)', $.jobMatcher($._config.jobs.query_frontend)),
        )
      )
      .addRow(
        g.row('Querier')
        .addPanel(
          $.containerCPUUsagePanel('CPU', $._config.jobs.querier),
        )
        .addPanel(
          $.containerMemoryWorkingSetPanel('Memory (workingset)', $._config.jobs.querier),
        )
        .addPanel(
          $.goHeapInUsePanel('Memory (go heap inuse)', $.jobMatcher($._config.jobs.querier)),
        )
      )
      .addRow(
        g.row('Compactor')
        .addPanel(
          $.containerCPUUsagePanel('CPU', $._config.jobs.compactor),
        )
        .addPanel(
          $.containerMemoryWorkingSetPanel('Memory (workingset)', $._config.jobs.compactor),
        )
        .addPanel(
          $.goHeapInUsePanel('Memory (go heap inuse)', $.jobMatcher($._config.jobs.compactor)),
        )
      )
      .addRow(
        g.row('Memcached')
        .addPanel(
          $.containerCPUUsagePanel('CPU', $._config.jobs.memcached),
        )
        .addPanel(
          $.containerMemoryWorkingSetPanel('Memory (workingset)', $._config.jobs.memcached),
        )
      )

      .addRow(
        g.row('Backend scheduler')
        .addPanel(
          $.containerCPUUsagePanel('CPU', $._config.jobs.backend_scheduler),
        )
        .addPanel(
          $.containerMemoryWorkingSetPanel('Memory (workingset)', $._config.jobs.backend_scheduler),
        )
        .addPanel(
          $.goHeapInUsePanel('Memory (go heap inuse)', $.jobMatcher($._config.jobs.backend_scheduler)),
        )
      )
      .addRow(
        g.row('Backend worker')
        .addPanel(
          $.containerCPUUsagePanel('CPU', $._config.jobs.backend_worker),
        )
        .addPanel(
          $.containerMemoryWorkingSetPanel('Memory (workingset)', $._config.jobs.backend_worker),
        )
        .addPanel(
          $.goHeapInUsePanel('Memory (go heap inuse)', $.jobMatcher($._config.jobs.backend_worker)),
        )
      )
      .addRow(
        g.row('Block builder')
        .addPanel(
          $.containerCPUUsagePanel('CPU', $._config.jobs.block_builder),
        )
        .addPanel(
          $.containerMemoryWorkingSetPanel('Memory (workingset)', $._config.jobs.block_builder),
        )
        .addPanel(
          $.goHeapInUsePanel('Memory (go heap inuse)', $.jobMatcher($._config.jobs.block_builder)),
        )

      ),
  },
}
